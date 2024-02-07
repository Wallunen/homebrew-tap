class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "334a15adae386d949a091119053a90ffb10484cf1ed8dcadad0eae43d1f51805" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "cddd6895653d7deea8b9e82e831307e3cdc41088dcd218ced4f1caa2fc15da44" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "b5383d39f88186d934a564267cb031634da347dfb6e93f17c8b80389a4a1de91" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.2636+476ba0475.tar.xz"
  version "0.12.0-dev.2636+476ba0475"
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
