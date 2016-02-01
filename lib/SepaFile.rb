class SepaFile
require 'nokogiri'

    def initialize()
    end

    def WriteFile
        open('myfile.xlm', 'w') do |f|
            f.puts create_xml
        end
    end

    def create_xml
        
        @installments = Installment.where("status=" + Installment.statuses[:open].to_s + " or status=" + Installment.statuses[:failed].to_s) 
       
        @num_install = 0
        @total_installments = 0
        
        sepa_number =get_sepa_number_and_increment
        
        @installments.each do |installment|
            @total_installments = @total_installments + installment.value
            @num_install = @num_install + 1
        end
        
        
        xml = Nokogiri::XML::Builder.new { |sepa| 
        sepa.CstmrDrctDbtInitn do
            sepa.GrpHdr do
                sepa.MsgId "123456"                                                 #Message Identification 35 - Point to point reference.
                sepa.CreDtTm Time.now.strftime("%Y-%D-%MT%H:%M:%SZ")                #Creation Date Time 
                sepa.NbOfTxs @num_intall                                          #Number of Transactions                
                sepa.CtrlSum @total_installments                                     #Control Sum
                sepa.InitgPty do
                    sepa.Nm "Peer to Peer"                                          #Initiating Party - Name
                end
            sepa.PmtInf {
                @installments.each do |installment|
                    sepa.PmtInfId "Processo-" + sepa_number.to_s + "Installment-" + installment.id.to_s
                                                                                    #Payment Information Group
                    sepa.PmtMtd "DD"                                                #Payment Method
                    sepa.NbOfTxs @num_intall.to_s                                 #Number of Transactions
                    sepa.CtrlSum @total_installments.to_s                            #Control Sum
                    sepa.PmtTpInf do                                                #Payment Type Information
                        sepa.SvcLvl do                                              #Service Level
                            sepa.Cd "SEPA"                                          #Code - obrigatorio "SEPA"
                        end
                        sepa.SeqTp "FRST"                                           #Sequence Type
                        sepa.CtgyPurp do
                            sepa.Cd "Loan"                                          #Category Purpose of the Collection - ISO Code
                        end
                    end
                    sepa.ReqdColltnDt Time.now.strftime("%Y-%D-%M")                 #Requested Collection Date
                    sepa.Cdtr do                                                     
                        sepa.Nm "Peer to  Peer"                                     #Creditor - Name
                    end
                    sepa.CdtrAcct do    
                        sepa.Id do
                            sepa.IBAN installment.project.entrepreneur.IBAN       #Creditor Account - Identification
                        end
                    end
                    sepa.CdtrAgt do 
                        sepa.FinInstnId do
                            sepa.BIC "BBPIPTPL"                                     #Creditor Agent - Identification 
                        end
                    end
                    sepa.CdtrSchmeId do
                        sepa.Id do
                            sepa.PrvtId do  
                                sepa.Othr do
                                    sepa.Id 'Cod.AT-02 Definir SIBS' 
                                end
                            end
                        end
                    end
                    #transação individualizada
                    sepa.DrctDbtTxInf do
                        sepa.PmtId do
                            sepa.EndToEndId do "D" + installment.project.id.to_s.rjust(10, '0')  + "I" + installment.id.to_s.rjust(10, '0') #subs
                            end
                        end
                        sepa.InstdAmt installment.value.to_s.rjust(18, '0') #subs
                        sepa.DrctDbtTx do
                            sepa.MndtRltdInf do
                                sepa.MndtId "12345678" #subs-identificação do mandato
                                sepa.DtOfSgntr "01-01-2000" #subs-data de assinatura do mandato
                            end
                        end
                        sepa.DbtrAgt do
                            sepa.FinInstnId do
                                sepa.BIC  "BBPIPTPL" #subs 
                                sepa.Id "NOTPROVIDED"
                            end
                        end
                        sepa.Dbtr do
                            sepa.Nm  "Silva"           #subs - nome do devedor
                        end
                        sepa.DbtrAcct do
                            sepa.Id do
                                sepa.IBAN  "12345"  #subs - IBAN 
                            end
                        end
                        
                        sepa.Purp do
                            sepa. Cd "LOAN"
                        end
                    end
                end
                } 
            end
        end
        }.to_xml
        return xml
    end
    
    def get_sepa_number_and_increment
        ipn= AppParameter.where(:parameter => "sepa_process_number").first
        sepa_number = ipn.value.to_f
        next_sepa_number = sepa_number+1
        ipn.value=next_sepa_number
        ipn.save
        return sepa_number
    end
end    