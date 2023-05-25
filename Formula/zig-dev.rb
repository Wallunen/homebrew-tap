class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "4acee6e12d4fe597cf78bb4e102e859adc59fa5dd6b24fa47e5cca58898e2528" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "dc6a3c34b684c207328f2f8d51c17716c72cc7030c805037d51e7ac9afb5c5ab" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "11ca9f308f41ebd57eb1116fe82537dd6a6d4edce8ed2416777f2717aa75b2d7" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.3289+16dbb960f.tar.xz"
  version "0.11.0-dev.3289+16dbb960f"
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
