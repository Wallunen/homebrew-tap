class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "78e3c9bd8814ceacb8469595195a5eaa4fb7c1a4e2f8e2fea19b6cc8536a87eb" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "c680bf28875a794036dd33f1dff215d1ec417fd0bc8e877f4fd7b4579db5a821" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "386be0e044a4edbbb4743f5fccdf41cf534e8823d85da254a09538beb4a98aeb" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.1371+5723fcaac.tar.xz"
  version "0.14.0-dev.1371+5723fcaac"
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
