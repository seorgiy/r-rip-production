ActiveAdmin.register Invite do
  menu label: "Инвайты"
  permit_params :name, :email, :tg
end
