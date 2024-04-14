class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "9128c7c4a6c86d29374485066c61596f8a6f138b60189585dfe79b639c5c907b" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "24865fbe983f2f8c19f58f7f17ca95251bff965c055f40fb085c92eed6ea103a" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "44784ea29745714d81b641e788feef1af6aa7fbab5a49f2b18bf2c9154ba7178" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.3652+a59ad719d.tar.xz"
  version "0.12.0-dev.3652+a59ad719d"
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
