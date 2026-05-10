class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260508-091140"
    rebuild 1
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "9292c5242a97a6689055bf4dbbae4a602ef35d37d54df7a145258aa6d83c2ce3"
    sha256 cellar: :any_skip_relocation, sequoia:      "25e62876b8d259d0af43b1e72f0e94e9055a450b300d33a31dd327ae94f58dc9"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "ff68bcbe707e929be352e11bc4d96b775e731357f9a37aca64929b32b1a8e595"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "81641a6ef015d8ffba99de25c81bac830f4c255e4527c8665b419556d6ecbc7c" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "38500f76294b4ce1c5e91824e2a664d7d7a2e8b7d2c4be37cddf63c11742ceb3" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "10ae629bd93c2702af210baa8992dc9ef53ca444535cbec71fa4a9d657c709dc" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.17.0-dev.269+ebff43698.tar.xz"
  version "0.17.0-dev.269+ebff43698"
  license "MIT"

  livecheck do
    skip "Dynamic `url` and `sha256`"
  end

  depends_on macos: :big_sur # https://github.com/ziglang/zig/issues/13313
  depends_on "z3"
  depends_on "zstd"

  uses_from_macos "ncurses"
  uses_from_macos "zlib"

  conflicts_with "zig", because: "both install a `zig` binary"

  def install
    bin.install "zig"
    lib.install "lib" => "zig"
  end
end
