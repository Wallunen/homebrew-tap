class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "1f245fa0e631a0296e66275afb6d9626b043919d09fe61c09549699f28d7cd69" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "2a2fa60a818b710398ce0ca728de93e047d950750d8ba062e778fa2fedbb6ddb" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "b97359ac5474bad024798a825bb468dc7c50eee01f254456b808d9fcaa2885e7" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.2847+db8ed730e.tar.xz"
  version "0.14.0-dev.2847+db8ed730e"
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
