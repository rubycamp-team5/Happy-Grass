class Scene
        @@scenes={}
        @@current_scene=nil
        @@directores=[]
        @@start_scene=nil
        @@latest_scene=nil


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
                self.reset_scene()
                self.move_to_first()
        end

         def self.reset_scene()
                @@scenes={}
                @@current_scene=nil
                for d in @@directores do
                        self._add(d[0],d[1])
                end
         end


        def self.move_to(title)
                @@current_scene=title.to_sym
        end

        def self.register_latest(title)
                @@latest_scene=title
        end

        def self.move_to_latest()
                self.move_to(@@latest_scene)

        end

        def self.play
                @@scenes[@@current_scene].play
        end

        def self.move_to_first()
                self.move_to(@@start_scene)
        end


end

