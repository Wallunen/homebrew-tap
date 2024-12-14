class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "b86b11a8edb22ea6b6d6b30729a47211fec49997f45ea118ccde23645aab036a" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "d4f7237d9cdacb12a345e3607bc82b1171d43db9c5763eb9ed85897e16b0e66d" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "1dac5145b2571bec3bf6b954c4488ea7539ab6203c1e5c35011c94fcc8615cc7" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.2457+82f35c518.tar.xz"
  version "0.14.0-dev.2457+82f35c518"
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
