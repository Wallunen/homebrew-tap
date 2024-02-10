class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "fd4a8ab873fa9e16557016da440438a11a1dc0f6ffa69193281e6a242946127f" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "fb9941f01e7eb066b7dab5ed4a632842521315b5c10278d021f9315e0de78e74" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "8ce09a5c1529c2e0a71ade578b976a834b94b2ebfda400caf03da0f599f1f70a" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.2668+ddcea2cad.tar.xz"
  version "0.12.0-dev.2668+ddcea2cad"
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
