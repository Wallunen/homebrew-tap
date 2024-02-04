class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "e03246b836c1b3a11e8368272c9b947152c868aab134d0a6ffaf87f34b10bbb3" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "5f830522026a18ee0c15998df86c437694c17c541c92a4a1940d4652f4b6c3f3" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "632406468832b358525a3135ca866e458a765fe9b3d19c0ce4982f1ff9d9e0ca" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.2546+f2e249e92.tar.xz"
  version "0.12.0-dev.2546+f2e249e92"
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
