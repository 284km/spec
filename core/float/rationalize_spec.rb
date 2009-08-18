require File.dirname(__FILE__) + '/../../spec_helper'

ruby_version_is "1.9" do
  describe "Float#rationalize" do
    it "returns self as a simplified Rational with no argument" do
      (3382729202.92822).rationalize.should == Rational(4806858197361, 1421)
    end

    # FIXME: These specs need reviewing by somebody familiar with the
    # algorithm used by #rationalize
    it "simplifies self to the degree specified by a Rational argument" do
      f = 0.3
      f.rationalize(Rational(1,10)).should == Rational(1,3)
      f.rationalize(Rational(-1,10)).should == Rational(1,3)

      f = -f
      f.rationalize(Rational(1,10)).should == Rational(-1,3)
      f.rationalize(Rational(-1,10)).should == Rational(-1,3)

    end

    it "simplifies self to the degree specified by a Float argument" do
      f = 0.3
      f.rationalize(0.05).should == Rational(1,3)
      f.rationalize(0.001).should == Rational(3, 10)

      f = -f
      f.rationalize(0.05).should == Rational(-1,3)
      f.rationalize(0.001).should == Rational(-3,10)
    end
  end
end
