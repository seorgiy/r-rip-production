ActiveAdmin.register Feedback do
  menu label: "Обратная связь"
  permit_params :author, :osoboe_mnenie
end
