#---
# Excerpted from "Agile Web Development with Rails",
# published by The Pragmatic Bookshelf.
# Rewritten with my content, pjfranzini
#---
# encoding: utf-8
Product.delete_all
Product.create(title: 'Vinca', 
  #latin_name: 'Vinca major', 
  description: 
    %{<p>
        An intensely purple five-petalled flower with glossy green leaves
        generally used as a flowering ground-cover.
      </p>},
  image_url:   'vinca.jpg',    
  price: 7.99)
# . . .
Product.create(title: 'Poppy', 
  #latin_name: 'Papaver Rhoes', 
  description:
    %{<p>
        A jubilantly red flower with four delicate papery petals, 
        sometimes used as a symbol of fallen soldiers.
      </p>},
  image_url: 'poppy.jpg',
  price: 5.99)
# . . .

Product.create(title: 'Ginestra (Broom)', 
#latin_name: 'Genista monspessulana', 
  description: 
    %{<p>
        A woody perennial shrub with vibrant yellow pea-family
        flowers, that produces seed pods resembly hairy snow pea pods.
      </p>},
  image_url: 'broom.jpg',
  price: 9.99)