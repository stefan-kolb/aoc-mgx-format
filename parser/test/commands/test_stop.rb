require_relative '../../../parser/lib/aoc-mgx/actions/stop'

require_relative '../test_helper'

class TestStop < MiniTest::Test
  def setup
    @files = Dir.glob(__dir__ + '/../fixtures/stop/*.dump')
  end

  def test_structure
    Dir.glob(__dir__ + '/../parser/data/stop/*.dump') do |dump|
      io = File.open(dump)
      struct = Stop.read(io)

      assert((1..40).member?(struct.selected_count), 'Selected count not in range 1..40: ' + dump)
      # assert(struct.obj_id.nonzero?, "Obj ID zero: " + dump)
    end
  end
end
