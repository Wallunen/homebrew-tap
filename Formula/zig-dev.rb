class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "7b705a897d8f051cdd5944e8fe58248d9629d76b51f8dace8142637b0682c636" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "3aba7c94f9f2c4704d315927be62ea2095d38584fe9424084c5a3b8555690397" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "629ee15113946fb338d120ca236552198ade33b96760b119549c669edd75c72b" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.2833+8802ec583.tar.xz"
  version "0.12.0-dev.2833+8802ec583"
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
