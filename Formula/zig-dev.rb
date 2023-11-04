class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "9f89346db71f42bf9bf4de1e673dee1ebf4fd27ae1518e394dcf9077caf73c73" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "088a8c468f301623bbe776bf0e68beb943760e0e6b640b16bcb5be1b50a0d6bc" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "ab7ee5e2f061b00a369a7b4fe3e3362bc61749f5cfb736dc5adf6d0fe7cb1d62" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.1391+ae6df9e96.tar.xz"
  version "0.12.0-dev.1391+ae6df9e96"
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
