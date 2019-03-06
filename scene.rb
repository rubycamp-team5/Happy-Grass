class Scene
        @@scenes={}
        @@current_scene=nil

        def self.add(director, title)
                @@scenes[title.to_sym]=director
        end

        def self.move_to(title)
                @@current_scene=title.to_sym
        end

        def self.play
                @@scenes[@@current_scene].play
        end
end

