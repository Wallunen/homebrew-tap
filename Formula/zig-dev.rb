class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "26ab245f3706b955e0ec162eb84c392cfe62a90655b0de7643a30df2bf09ac46" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "b343034224a028cf799ababe78464025aa220e9a664f1b2bbd5d6c6170720257" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "8fade155dda64dff2ba6600853e42e514b4fbb783bd74d0adc55f43156b78eb4" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.3365+cbeab678a.tar.xz"
  version "0.12.0-dev.3365+cbeab678a"
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
