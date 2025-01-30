class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "24d8f2a509d04db81f229017aedb0f882d6452a5e500f04ec96b3c15b967af24" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "1ba106c98cf040f2d958fcf41b24229693bcfc2cace6c48c9b4726fc5c5d8f3c" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "3513e4d878d73d07b9c2dc11cc7e2470ca4155100c0a9c73ecc3dc40f6062c06" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.2989+bf6ee7cb3.tar.xz"
  version "0.14.0-dev.2989+bf6ee7cb3"
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
