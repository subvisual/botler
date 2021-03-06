module CategoryRepresenter
  include Roar::JSON
  include Roar::Hypermedia

  property :id
  property :name

  collection :subcategories, extend: SubcategoryRepresenter, class: Category

  link :self do
    api_category_url self
  end
end
