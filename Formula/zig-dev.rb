class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "d0b8d3a5890d41fe4a5253acb9cefcbb13eba37ee263a80f2a510e80dbe7c763" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "bb16d50cefb2141446a55f49c75085623bdf2fa275dd6359dfafc8fb0fbce5a8" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "d669cc27ff97211f22000c5a75e3b8ef971dd0541e1d55cbdc38383a7ea6e679" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.1987+a2c6ecd6d.tar.xz"
  version "0.11.0-dev.1987+a2c6ecd6d"
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
