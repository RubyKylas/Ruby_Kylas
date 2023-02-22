p = Proc.new { 
    class A
        def a
            puts "A"
        end
        def initialize
            a           
        end
    end    
}
p.call()
