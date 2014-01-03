class NewSalesGroupScreen < PM::FormotionScreen
  title "Add a Sales Group"

  def table_data
    {
      sections: [{
        title: "New Sales Group",
        rows: [{
          title: "Name",
          key: :name,
          placeholder: "Sales Group Name",
          type: :string,
          auto_correction: :no,
          auto_capitalization: :none
          },
          {
            title: "state",
            key: :state,
            type: :picker,
            items: ["New York", "Pennsylvania", "New Jersey", "Delaware"]           
            }, {
              title: "County",
              key: :county,
              placeholder: "County Name",
              type: :string,
              auto_correction: :no,
              auto_capitalization: :none              
              }, {
                title: "Township",
                key: :township,
                placeholder: "Township Name",
                type: :string,
                auto_correction: :no,
                auto_capitalization: :none                
                }, {
                  title: "Submit",
                  key: :submit,
                  type: :submit
                  }
            ]
        }]
    }
  end

  def on_submit(form)
    
  end
end