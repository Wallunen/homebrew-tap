class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "f688b0a8745d81e1cafa1f11ada39f2e183df4f9de3911da01d5aeee9f3933f7" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "56c2f71c3444dbf1c957526fb7f8f3d69200a192db8d48958e01416d46d16874" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "ad5652c616731812d3bd9ec601529627fa63c9874ec30e62bcf9b9d7a01598ae" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.560+fa95c89a7.tar.xz"
  version "0.14.0-dev.560+fa95c89a7"
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
