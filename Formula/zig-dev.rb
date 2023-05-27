class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "b94d7ee446b6239400dde71103ec4b3d976e008c8472e46643e9414a6477fadf" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "601daf71c6cb48a9e99291c50374f5ec9558bc3a743211395de832bd058467f7" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "50a79268318d2406bb6ecea6dbf39587a3c3ddad31cff0d031a7fef346b949cb" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.3302+41502c6aa.tar.xz"
  version "0.11.0-dev.3302+41502c6aa"
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
