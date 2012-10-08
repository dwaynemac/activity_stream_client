require File.dirname(__FILE__)+'/../../spec_helper'
require File.dirname(__FILE__)+'/../../../app/models/activity_stream/activity'

module ActivityStream
  describe Activity do
    describe "#find" do
      before do
        mock_index()
      end
      it "should make Typhoeus calls" do
        expect{Activity.paginate}.not_to raise_exception
      end
    end
  end
end
