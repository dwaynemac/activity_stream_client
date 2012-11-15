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

    describe "#local?" do
      subject { Activity.new }
      context "when local app name is defined" do
        before do
          LOCAL_APP_NAME = 'local-app-name'
        end
        context "when generator == app name" do
          before { subject.generator = 'local-app-name' }
          its(:generator){ should == 'local-app-name'}
          it { should be_local }
        end
        context "when generator != app name" do
          before { subject.generator = 'other-app-name' }
          it { should_not be_local }
        end
      end
      context "when local app name is not defined" do
        it { should_not be_local }
      end
    end
  end
end
