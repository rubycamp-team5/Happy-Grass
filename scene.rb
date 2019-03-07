class Scene
        @@scenes={}
        @@current_scene=nil
        @@directores=[]
        @@start_scene=nil


        def self._add(director,title)
                @@scenes[title.to_sym]=director.new()
        end
                
        def self.add(director, title)
                @@directores <<[director,title]
        end

        def self.register_first_scene(title)
                @@start_scene=title
        end

        def self.start()
                @@scenes={}
                @@current_scene=nil
                for d in @@directores do
                        self._add(d[0],d[1])
                end
                self.move_to(@@start_scene)
        end


        def self.move_to(title)
                @@current_scene=title.to_sym
        end

        def self.play
                @@scenes[@@current_scene].play
        end
end

