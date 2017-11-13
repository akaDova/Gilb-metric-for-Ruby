require './gilb_metric'

$gilb = GilbMetric.new(File.open('./code.rb').read)
$gilb.show
$gilb