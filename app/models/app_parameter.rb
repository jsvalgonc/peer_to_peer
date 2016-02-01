class AppParameter < ActiveRecord::Base
    #criar parametro - insert into app_parameters (parameter,value,created_at,updated_at) values ("sepa_process_number",1,date('now'),date('now')); 
    #modificar parametro - update app_parameters set value="2016-01-31", updated_at = date('now') where id=1;
end
