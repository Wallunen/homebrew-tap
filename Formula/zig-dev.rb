class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "7eadc49ff1a9f71179ae68b951f20d75078962d15ddd5e8df5c5a5c96d2e2dc8" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "fb5c7219b68b88cfc39b921c9fbd67daeeba83601f77388f630e70460729e395" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "7c530ab890424c462ae1cddf8044644909dfb2da5caa8844c7d92ab1abdc2d58" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.3597+d979df585.tar.xz"
  version "0.12.0-dev.3597+d979df585"
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
