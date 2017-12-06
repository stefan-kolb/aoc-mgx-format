require_relative '../../../parser/lib/aoc-mgx/actions/gather'

require_relative '../test_helper'

class TestGather < MiniTest::Test
  def setup
    @files = Dir.glob(File.join(__dir__ + '/../fixtures/gather/*.dump'))
  end

  def test_structure
    @files.each do |dump|
      begin
          io = File.open(dump)
          struct = Gather.read(io)

          unit_selection? struct.selected_count, dump
          unused_bytes? struct.zero, dump
          # obj id
          # obj type
          coordinate? struct.x_coordinate, dump
          coordinate? struct.y_coordinate, dump
          assert_equal(struct.selected_count, struct.objects.size)
        rescue EOFError
          puts dump
        end
    end
  end
end
