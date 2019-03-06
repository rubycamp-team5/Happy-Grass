class Scene
        @@scenes={}
        @@current=nil

        def self.add(director,title)
                @@scenes[title.to_sym]=director
        end

        def self.move_to(title)
                @@current=title.to_sym
        end

        def self.play
                @@scenes[@@current].play
        end
end

