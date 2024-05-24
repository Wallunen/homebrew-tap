class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "ca6e51abb1f2eccc819d9c4fd5ecac6af6c0c3416d2341d371b61c769900b30c" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "aa91a8ec35e633b2a4ea286dd109838cbaefe979a9af618c6e189d87aec0d1f7" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "8b7cf33d260f58fa5490cdc7b4b56d17931e7d07ab5457db47873bc655da6b64" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.13.0-dev.260+fb88cfdf6.tar.xz"
  version "0.13.0-dev.260+fb88cfdf6"
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
