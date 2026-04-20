require "language/node"

class Scaffold < Formula
  desc "AI-powered software project scaffolding pipeline"
  homepage "https://github.com/zigrivers/scaffold"
  url "https://github.com/zigrivers/scaffold/archive/refs/tags/v3.18.1.tar.gz"
  sha256 "6ef26a49549c5dee8317ebe38473a60e6278c20694f458ebb5c2e152e8a201ff"
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
