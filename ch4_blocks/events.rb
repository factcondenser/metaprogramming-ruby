# event "an event that always happens" do
#   true
# end
#
# event "an event that never happens" do
#   false
# end
#
# def monthly_sales
#   110 # TODO: read the real number from the database
# end
#
# target_sales = 100
#
# event "monthly sales are suspiciously high" do
#   monthly_sales > target_sales
# end
#
# event "monthly sales are abysmally low" do
#   monthly_sales < target_sales
# end

setup do
  puts "Setting up sky"
  @sky_height = 100
end

setup do
  puts "Setting up mountains"
  @mountains_height = 200
end

event "the sky is falling" do
  @sky_height < 300
end

event "it's getting closer" do
  @sky_height < @mountains_height
end

event "whoops... too late" do
  @sky_height < 0
end
