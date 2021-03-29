class Gothanks < Formula
  desc "Automatically star your go.mod Github dependencies"
  homepage "https://github.com/psampaz/gothanks"
  url "https://github.com/psampaz/gothanks/archive/v0.3.0.tar.gz"
  sha256 "ce5440334b3eac2e058724faa4c6e4478ca1d81ea087e55ccca33f1996752aad"
  license "MIT"

  bottle do
    root_url "https://github.com/kargirwar/homebrew-test/releases/download/gothanks-0.3.0"
    sha256 cellar: :any_skip_relocation, catalina:     "8aafc17fa76bdf3fa035e73df4acd1a40ae5aca48d07c7b1c53494cf99aea721"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "d6da84cb89b76900cdffe7b0a7ceb92542d27e2ee2372e900b443b5fedd0b45b"
  end

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args
  end

  test do
    ENV.delete "GITHUB_TOKEN"
    assert_match "no Github token found", shell_output(bin/"gothanks", 255)
  end
end
