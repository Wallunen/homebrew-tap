class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "901f47ced3b5e74ed308f3ef17b27aa3fd2d5d7a3e32d982909f78fe69e64183" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "1f811e599599058a4f09cbbf0a0120bec647c1753d500c3e665bb8357c9b5bd8" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "9edf9e832ac1e290eabb9b7249bb7a19d4ce2d3a384df635e74ce782ada1552f" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.225+45be80364.tar.xz"
  version "0.14.0-dev.225+45be80364"
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
