class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260713-175022"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "9e39fc35fb72e3bda6211b28687118f78b61c178a175c03e83d758be4c03d443"
    sha256 cellar: :any_skip_relocation, sequoia:      "db1608025191d553ff595c1b05c47641abd6b19a41ab5e547c68cb01ae004b06"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "ed2b45f182fe9e5c05194c537819bc270b6e4d04c7e3e7f46f604c0e9ac2302a"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "bfe63e7f921f7a500c904ca52670beb61ab07fca03ecc6b64396fa5a40059f95" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "027a751c994b5d4e658c0999c34f5d704829aa2dbf862178b37ee7fd3dde1887" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "74c7124fb69fd31bed0f613fe938a1979425589a1fd77baa4f550117fee47f6c" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.17.0-dev.1397+4331ba0fb.tar.xz"
  version "0.17.0-dev.1397+4331ba0fb"
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
