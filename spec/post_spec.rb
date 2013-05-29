require 'spec_helper'

describe Post do

  before { @post = Post.new(title: "Pierwszy post", text: "Witaj na moim blogu. Chce dostac 5") }

  subject { @post }

  it { should respond_to(:title) }
  it { should respond_to(:text) }

#specjalnie zle
#it{ should respond_to(:zly_argument) }
end

