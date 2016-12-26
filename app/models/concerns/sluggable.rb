module Sluggable
 module Instance
   def slug
     words = self.name.split(" ")
     words.map! { |word| word.downcase }
     words.join("-")
   end
 end

 module Class
   def find_by_slug(slug)
     words = slug.split("-")
     words.map! { |word| word.capitalize }
     name = words.join(" ")
     self.where("name like ?", name).first
   end
 end
end
