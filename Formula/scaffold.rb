require "language/node"

class Scaffold < Formula
  desc "AI-powered software project scaffolding pipeline"
  homepage "https://github.com/zigrivers/scaffold"
  url "https://github.com/zigrivers/scaffold/archive/refs/tags/v2.2.2.tar.gz"
  sha256 "f6bfa476daf94701daf31e8ef6611134f1cdff8a0fec48845e0b036d97c01aa8"
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
