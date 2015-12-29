module NavigationHelpers
  def path_to(page_name)
    case page_name
    when /Registo Inicial/ then '/users/sign_up'
    when /Registo de Investidor/ then '/investors/new'
    when /Registo de Empreendedor/ then '/entrepreneurs/new'
    when /^the main entrepreneur page for "(.*)"$/ then 
      entrepreneur_main_path(Entrepreneur.find_by_full_name($1))
    when /Selecionar investidor/ then '/investors'
    when /^the page Consultar Conta for "(.*)"$/ then
        account_movements_list_investor_path(Investor.find_by_full_name($1))
    when /^the Selecionar Projecto for "(.*)"$/ then
        index_investor_path(Investor.find_by_full_name($1))
    when /Projectos/ then 'projects'
    #when /Consultar Conta/ then '/account_movements/list_investor/'
    else
      begin
        page_name =~ /the (.*) page/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue Object => e
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)
World(FactoryGirl::Syntax::Methods)
