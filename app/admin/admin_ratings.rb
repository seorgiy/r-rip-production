ActiveAdmin.register AdminRating do
  active_admin_import validate: false,
  template: 'import' ,
  template_object: ActiveAdminImport::Model.new(
      hint: "you can configure CSV options",
      csv_options: { col_sep: ";", row_sep: nil, quote_char: nil }
  )
  menu label: "Оценки"

end
