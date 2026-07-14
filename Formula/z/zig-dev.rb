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
      sha256 "cbb581620a8cd5c3a77d2af6dd333e6356f7f8533e20388cae65144185f5af1c" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "1857c99ceec2d4f1e536c68c07e7270ee06a8311f81751f8142425365734b05c" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "b1ce3b71d7eac51655fdeb89057e6a2c6c689b25c3e0c995a1caa1d5a5f5cd57" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.17.0-dev.1398+cb5635714.tar.xz"
  version "0.17.0-dev.1398+cb5635714"
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
