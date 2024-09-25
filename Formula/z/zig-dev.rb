class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "5c098b3822f155d93bc35d51964af3bdd4cb8a012fbebad9268cfbcd71ee9d30" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "7e68f0feef0db2f8c0297b9d036ab058060323a4ba0d45c44ada12418533dece" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "c135ada7f0f97b99563fea2534279182e74f318ed3d6ebe4a512831256d23551" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.1646+b19d0fb0f.tar.xz"
  version "0.14.0-dev.1646+b19d0fb0f"
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
