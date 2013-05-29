require 'spec_helper'

describe Comment do

  before { @comment = Comment.new(text: "Ten blog jest najlepszy",) }

  subject { @comment }

  it { should respond_to(:text) }
 it { should respond_to(:fieldname) }
 it { should respond_to(:author) }
 it { should respond_to(:post_id) }

end
