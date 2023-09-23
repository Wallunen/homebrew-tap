class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "d399964d78eff4823b33ba6f26314bc1a44c218709a5b4a49c5915c49031ec72" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "f303e6410368fd9a03cc07c8115e76c354abbfac3666fd5e70732746a3efa033" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "672b855135babcc4582b00daedaf88cf6f796c169dc9b528f58217a0336ff956" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.494+a8d2ed806.tar.xz"
  version "0.12.0-dev.494+a8d2ed806"
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
