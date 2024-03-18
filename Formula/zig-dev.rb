class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "b421d33aea1df281dbf6c5d88f42141250f535ea7afa3517257d87269abe18e2" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "762f95d4cdb199b80544f9e97cf0d70d88702b89062e28120681973cc8170b44" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "2790c3dc9cbf7d280ac12f764d03da23bdb1bb2b74f29ce2338ce41b19c28295" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.3342+f88a971e4.tar.xz"
  version "0.12.0-dev.3342+f88a971e4"
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
