class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "fa898c36225a670044ed1616f55fead5c7ff95ca36b503002ce27f6cfe7b905f" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "b544093038fc312d46d62be77ea574fc23d0cc0c79cc8f344fcde87cfb368816" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "1cb094e3eecd5e7402c5f56e1cadd79eca9f29e67199bf2b0fe473348fd90492" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.2727+fad5e7a99.tar.xz"
  version "0.12.0-dev.2727+fad5e7a99"
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
