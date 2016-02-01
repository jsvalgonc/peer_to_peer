class Invitation < ActiveRecord::Base
  belongs_to :user
  
    def self.new_by_agent(agent_id)
        @invitation = Invitation.new
        @invitation.user_id = agent_id
        @invitation.used= 'f'
        @invitation.used_date = ''
        @invitation.email =''
        @invitation.inv_key = create_invitation_key
        @invitation.registered = ''
        @invitation.save
    end
    
private

    def self.create_invitation_key
      o = [('a'..'z'), ('A'..'Z'),('1'..'9')].map { |i| i.to_a }.flatten
      inv_key = (0...50).map { o[rand(o.length)] }.join
      return inv_key
    end
  
end
