class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "46879dcb6f30fd8591c39505be0d1cba6bbb5b0171e22cd4cf3a4f8b3f224851" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "3375a7ff35e31239f981cc250a31b0f6203f66495cd88f616027d51e33b5d113" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "595bf2c2ffe8f1de7f5a4c160a5f30e6befb327828360f543571a74e5715cb1c" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.2705+320c4d68f.tar.xz"
  version "0.12.0-dev.2705+320c4d68f"
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
