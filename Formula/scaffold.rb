require "language/node"

class Scaffold < Formula
  desc "AI-powered software project scaffolding pipeline"
  homepage "https://github.com/zigrivers/scaffold"
  url "https://github.com/zigrivers/scaffold/archive/refs/tags/v3.23.0.tar.gz"
  sha256 "1aaeff6babbfe713e16c6c2e30eae303b4faf700384b766a9bc8f33777b8d35a"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install"
    system "npm", "run", "build"
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_match "scaffold", shell_output("#{bin}/scaffold version")
  end
end
