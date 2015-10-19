require_relative "./level.rb"
require_relative "./force.rb"
require_relative "./defense.rb"
require_relative "./hit_point.rb"
require_relative "./magic_point.rb"

module Stats

    class Status
        attr_accessor :hit_point, :magic_point, :force, :defense
        def initialize(hit_point=Stats::DEFAULT_HIT_POINT,
                       magic_point=Stats::DEFAULT_MAGIC_POINT,
                       force=Stats::DEFAULT_FORCE,
                       defense=Stats::DEFAULT_DEFENSE)
            @hit_point = hit_point
            @magic_point = magic_point
            @force = force
            @defense = defense
        end
    end

    DEFAULT_STATUS = Status.new()
end